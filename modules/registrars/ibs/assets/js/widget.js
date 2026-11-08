if (typeof window.BalanceWidget !== "undefined") {
  // Already initialised, do not redefine
  exit;
}
class BalanceWidget {
  constructor(widgetId, ttl, expires, status, ico, timerSelector) {
    this.widgetId = widgetId;
    this.ttl = ttl;
    this.expires = expires;
    this.status = status;
    this.ico = ico;
    this.timerSelector = timerSelector;
  }

  ibsRefreshWidget(widgetName, requestString, cb) {
    const panelBody = $(`.panel[data-widget="${widgetName}"] .panel-body`);
    const url = WHMCS.adminUtils.getAdminRouteUrl(
      "/widget/refresh&widget=" + widgetName
    );
    panelBody.addClass("panel-loading");
    // Build data object with CSRF token and request params
    const data = {
      token: csrfToken ?? WHMCS.csrfToken,
    };
    // Parse requestString into key/value pairs and add to data
    requestString.split("&").forEach(pair => {
      const [key, value] = pair.split("=");
      if (key) data[key] = value;
    });
    return WHMCS.http.jqClient
      .post(
        url,
        data,
        (data) => {
          this.lastExecution = true;
          panelBody.html(data.widgetOutput);
          panelBody.removeClass("panel-loading");
        },
        "json"
      )
      .always(cb);
  }

  mainWidget() {
    let widgetId = this.widgetId;
    let ttl = this.ttl;
    let expires = this.expires;
    let widgetStatus = this.status;
    let ico = this.ico;
    if (
      $(`#panel${widgetId} .widget-tools .ibs-widget-toggle`).length === 0
    ) {
      $(`#panel${widgetId} .widget-tools`).prepend(
        ` <a href = "#" class="ibs-widget-toggle" data-status="${widgetStatus}">
                <i class=\"fas fa-toggle-${ico}"></i>
          </a> `
      );
    } else {
      $(`#panel${widgetId} .widget-tools .ibs-widget-toggle`).attr(
        "data-status",
        widgetStatus
      );
    }

    if (!$(this.timerSelector).length) {
      $(`#panel${widgetId} .widget-tools`).prepend(
        ` <a href="#" class="ibs-widget-expires" data-expires="${expires}" data-ttl="${ttl}">
            <span id="${widgetId}BalanceExpires" class="ttlcounter"> </span>
          </a>`
      );
    }

    $(this.timerSelector)
      .data("ttl", ttl)
      .data("expires", expires)
      .html(this.ibsSecondsToHms(expires, ttl));
    if ($(`#panel${widgetId} .ibs-widget-toggle`).data("status") === 1) {
      $(`#panel${widgetId} .ibs-widget-expires`).show();
    } else {
      $(`#panel${widgetId} .ibs-widget-expires`).hide();
    }

    $(`#panel${widgetId} .ibs-widget-toggle`)
      .off()
      .on(
        "click",
        { toggleSelector: `#panel${widgetId} .ibs-widget-toggle` },
        (event) => {
          event.preventDefault();
          const $toggle = $(event.data.toggleSelector);
          const icon = $toggle.find('i[class^="fas fa-toggle-"]');
          const widget = $toggle.closest(".panel").data("widget");
          const newstatus = 1 - parseInt($toggle.attr("data-status"), 10);
          const token = csrfToken;
          icon.attr("class", "fas fa-spinner fa-spin");
          this.ibsRefreshWidget(
            widget,
            "refresh=1&status=" + newstatus + "&token=" + token,
            () => {
              icon.attr(
                "class",
                "fas fa-toggle-" + (newstatus === 0 ? "off" : "on")
              );
              $toggle.attr("data-status", newstatus);
              const $expires = $(`#panel${widgetId} .ibs-widget-expires`);
              if (newstatus === 1) {
                $expires.show();
              } else {
                $expires.hide();
              }
              if (typeof packery !== "undefined") {
                packery.fit($toggle[0]);
                packery.shiftLayout();
              }
            }
          );
        }
      );
  }

  ibsStartCounter() {
    let sel = this.timerSelector;
    if (!$(sel).length) {
      return;
    }
    setInterval(this.ibsDecrementCounter.bind(this), 1000);
  }

  ibsDecrementCounter() {
    let sel = this.timerSelector;
    if (!$(sel).length) {
      return;
    }
    let expires = $(sel).data("expires") - 1;
    const ttl = $(sel).data("ttl");
    $(sel).data("expires", expires);
    $(sel).html(this.ibsSecondsToHms(expires, ttl));
  }

  ibsSecondsToHms(d, ttl) {
    d = Number(d);
    const ttls = [3600, 60, 1];
    let units = ["h", "m", "s"];
    let vals = [
      Math.floor(d / 3600), // h
      Math.floor((d % 3600) / 60), // m
      Math.floor((d % 3600) % 60), // s
    ];
    let steps = ttls.length;
    ttls.forEach((row) => {
      if (ttl / row === 1 && ttl % row === 0) {
        steps--;
      }
    });
    vals = vals.splice(vals.length - steps);
    units = units.splice(units.length - steps);
    let html = "";
    vals.forEach((val, idx) => {
      html += " " + val + units[idx];
    });
    return html.substr(1);
  }
}
