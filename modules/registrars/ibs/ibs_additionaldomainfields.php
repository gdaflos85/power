<?php

/***********************************************************
IMPORTANT IF YOU INTEND TO MAKE CHANGES IN THIS FILE
The entries in this file are like this (taking as example one option for .fr domains but all others are similar):
$additionaldomainfields[".fr"][0] = [
    "Name" => "Holder Type",
    "DisplayName" => "Type titulaire",
    "Type" => "dropdown",
    "Options" => "individual|Personne Physique,company|Entreprise,trademark|Titulaire de Marque,association|Association,other|Autre",
    "Default" => "individual",
    ];

In the above do not make any changes in the "Name" field as it will make the module to stop workling properly
The text that will appear in the web interface is on the right of "DisplayName" =>
For example you can change this:
"DisplayName" => "Type titulaire",
with this:
"DisplayName" => "Owner type",

Also for entries that have drop downs the entries are a comma separated list of values liek this:
"Options" => "individual|Personne Physique,company|Entreprise,trademark|Titulaire de Marque,association|Association,other|Autre",
To generalize this the entries are a comma separated list of  "key|value" entries.  In that never change the key part (what is on the left of the | character. For example you can change this:
"Options" => "individual|Personne Physique,company|Entreprise,trademark|Titulaire de Marque,association|Association,other|Autre",
to this:
"Options" => "individual|Individual,company|Company,trademark|Trademark owner,association|Association,other|Other",

As you can see for each key|value group only the value can be changed. Changing the key will cause malfunction of the module

NOTE: Translation only works with WHMCS 4.5 and above!

 ************************************************************/

/*
  If you intend to register .uk domains using this module make sure that the following exists in your includes/additionaldomainfields.php file,
  if not exists then add the following at the end of the file includes/additionaldomainfields.php
 */

// Load list of countries
$country = new \WHMCS\Utility\Country();
$countries = $country->getCountryNameArray();
$countrymap = [];
foreach ($countries as $key => $value) {
    $countrymap[] = str_replace(",", "", $key) . "|" . str_replace(",", "", $value);
}
$countryOpts = implode(",", $countrymap);
$countryOptsOptional = "|None selected," . $countryOpts;

/* * ************* START .AU ****************** */
$additionaldomainfields[".com.au"] = [];
$additionaldomainfields[".com.au"][] = [
    "Name" => "comaulegalentitytype",
    "DisplayName" => "Legal Entity Type",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "ABN|Australian Business Number",
        "ACN|Australian Company Number",
        "TM|Trademark",
        "OTHER|Other"
    ]),
    "Required" => true,
    "LangVar" => "comauLegalEntityType",
];
$additionaldomainfields[".com.au"][] = [
    "Name" => "comaurelationtype",
    "DisplayName" => "Relation type",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "Company|Company",
        "RegisteredBusiness|Registered Business",
        "SoleTrader|Sole Trader",
        "Partnership|Partnership",
        "TrademarkOwner|Trademark Owner",
        "PendingTMOwner|Pending Trademark Owner",
        "CitizenResident|Citizen / Resident",
        "IncorporatedAssociation|Incorporated Association",
        "Club|Club",
        "NonProfitOrganisation|Non-Profit Organisation",
        "Charity|Charity",
        "TradeUnion|Trade Union",
        "IndustryBody|Industry Body",
        "CommercialStatutoryBody|Commercial Statutory Body",
        "PoliticalParty|Political Party",
        "Other|Other"
    ]),
    "Required" => true,
    "LangVar" => "comauRelationType"
];
$additionaldomainfields[".com.au"][] = [
    "Name" => "comaucompanynumber",
    "DisplayName" => "Company / Trademark ID",
    "Type" => "text",
    "Size" => "50",
    "Required" => true,
    "LangVar" => "comauCompanyNumber",
];
$additionaldomainfields[".com.au"][] = [
    "Name" => "comautrademarkownername",
    "DisplayName" => "Trademark Owner Name",
    "Type" => "text",
    "Size" => "120",
    "Required" => true,
    "LangVar" => "comauTrademarkOwnerName"
];

/* * ************* START .CA ****************** */
$additionaldomainfields[".ca"] = [];
$additionaldomainfields[".ca"][] = [
    "Name" => "calegalentitytype",
    "DisplayName" => "Legal Entity Type",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "ABO|Aboriginal Peoples indigenous to Canada",
        "ASS|Canadian Unincorporated Association",
        "CCO|Corporation (Canada or Canadian province or territory)",
        "CCT|Canadian citizen",
        "EDU|Canadian Educational Institution",
        "GOV|Government or government entity in Canada",
        "HOP|Canadian Hospital",
        "INB|Indian Band recognized by the Indian Act of Canada",
        "LAM|Canadian Library, Archive or Museum",
        "LGR|Legal Rep. of a Canadian Citizen or Permanent Resident",
        "MAJ|Her Majesty the Queen",
        "OMK|Official mark registered in Canada",
        "PLT|Canadian Political Party",
        "PRT|Partnership Registered in Canada",
        "RES|Permanent Resident of Canada",
        "TDM|Trade-mark registered in Canada",
        "TRD|Canadian Trade Union",
        "TRS|Trust established in Canada"
    ]),
    "Required" => true,
    "LangVar" => "caLegalEntityType",
];
$additionaldomainfields[".ca"][] = [
    "Name" => "catrademarknumber",
    "DisplayName" => "Trademark Number",
    "Type" => "text",
    "Size" => "50",
    "Required" => [
        "calegalentitytype" => [
            "TDM"
        ]
    ],
    "LangVar" => "caTrademark",
];
$additionaldomainfields[".ca"][] = [
    "Name" => "catrademark",
    "DisplayName" => "Domain Name is a Trademark",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "0|No",
        "1|Yes"
    ]),
    "Required" => false,
    "LangVar" => "caTrademark",
];

/* * *************  END .CA  ****************** */

/* * ************* START .UK ****************** */
$additionaldomainfields[".co.uk"] = [];
$additionaldomainfields[".co.uk"]["legaltype"] = [
    "Name" => "Legal Type",
    "DisplayName" => "Legal Type",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "IND|Individual",
        "LTD|UK Limited Company",
        "PLC|UK Public Limited Company",
        "PTNR|UK Partnership",
        "LLP|UK Limited Liability Partnership",
        "STRA|Sole Trader",
        "IP|Industrial/Provident Registered Company",
        "SCH|UK School",
        "RCHAR|UK Registered Charity",
        "GOV|Government Body",
        "CRC|Corporation By Royal Charter",
        "STAT|Uk Statutory Body",
        "OTHER|UK Entity (other)",
        "FIND|Non-UK Individual",
        "FCORP|Non-Uk Corporation",
        "FOTHER|Other foreign entity"
    ]),
    "Default" => "Individual",
    "LangVar" => "ukLegalType",
];
# the following is NOT required when "Legal Type" is "Individual"
$additionaldomainfields[".co.uk"]["registrationnumber"] = [
    "Name" => "Company ID Number",
    "DisplayName" => "Company Registration Number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "ukRegistrationNumber",
];
# the following is required only when "Legal Type" is "Individual"
$additionaldomainfields[".co.uk"]["hidewhois"] = [
    "Name" => "WHOIS Opt-out",
    "DisplayName" => "Hide whois details",
    "Type" => "tickbox",
    "LangVar" => "ukhidewhois",
];

$additionaldomainfields[".org.uk"] = $additionaldomainfields[".co.uk"];

$additionaldomainfields[".me.uk"] = $additionaldomainfields[".co.uk"];
$additionaldomainfields[".uk"] = $additionaldomainfields[".co.uk"];

/* * ************* END .UK ****************** */

/*
  If you intend to register .eu domains using this module make sure that the following exists in your includes/additionaldomainfields.php file,
  if not exists then add the following at the end of the file includes/additionaldomainfields.php
 */
/* * ************* START .EU ****************** */
$additionaldomainfields[".eu"] = [];
$additionaldomainfields[".eu"][] = [
    "Name" => "Language",
    "DisplayName" => "Language",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "cs|Czech",
        "da|Danish",
        "de|German",
        "el|Greek",
        "en|English",
        "es|Spanish",
        "et|Estonian",
        "fi|Finnish",
        "fr|French",
        "hu|Hungarian",
        "it|Italian",
        "lt|Lithuanian",
        "lv|Latvian",
        "mt|Maltese",
        "nl|Nederlands",
        "pl|Polish",
        "pt|Portuguese",
        "sk|Slovak",
        "sl|Slovenian",
        "sv|Swedish",
        "ro|Romanian",
        "bg|Bulgarian",
        "ga|Irish"
    ]),
    "Default" => "en",
    "Required" => true,
];
/* * ************* END .EU ****************** */

/* * ************* START .BE ****************** */
$additionaldomainfields[".be"] = [];
$additionaldomainfields[".be"][] = [
    "Name" => "Language",
    "DisplayName" => "Language",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "en|English",
        "fr|French",
        "nl|Nederlands"
    ]),
    "Default" => "en",
    "Required" => true,
];
/* * ************* END .BE ****************** */

/*
  If you intend to register .asia domains using this module make sure that the following exists in your includes/additionaldomainfields.php file,
  if not exists then add the following at the end of the file includes/additionaldomainfields.php
 */

/* * ************* START .ASIA ****************** */
$additionaldomainfields[".asia"] = [];
$additionaldomainfields[".asia"]["locality"] = [
    "Name" => "Locality",
    "DisplayName" => "Locality",
    "Type" => "dropdown",
    "Options" => $countryOpts,
    "Default" => "AF",
    "Required" => true,
    "LangVar" => "asiaLocality",
];
$additionaldomainfields[".asia"]["legalentity"] = [
    "Name" => "Legal Entity Type",
    "DisplayName" => "Legal Entity Type",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "naturalPerson|Natural person",
        "corporation|Corporation",
        "cooperative|Cooperative",
        "partnership|Partnership",
        "government|Government",
        "politicalParty|Political Party",
        "society|Society",
        "institution|Institution",
        "other|Other"
    ]),
    "Default" => "naturalPerson",
    "LangVar" => "asiaLegalEntity",
];
$additionaldomainfields[".asia"]["identificationform"] = [
    "Name" => "Identification Form",
    "DisplayName" => "Identification Form",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "passport|Passport",
        "certificate|Certificate",
        "legislation|Legislation",
        "societyRegistry|Society Registry",
        "politicalPartyRegistry|Political Party Registry",
        "other|Other"
    ]),
    "Default" => "passport",
    "LangVar" => "asiaIdentificationForm"
];
$additionaldomainfields[".asia"]["identificationnumber"] = [
    "Name" => "Identification Number",
    "DisplayName" => "Identification Number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "LangVar" => "asiaIdentificationNumber"
];
# the following is required only when "Legal Entity Type" is "other"
$additionaldomainfields[".asia"]["otherlegalentity"] = [
    "Name" => "Other legal entity type",
    "DisplayName" => "Other legal entity type",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "Langvar" => "asiaOtherLegalEntity"
];
# the following is required only when "Identification Form" is "other"
$additionaldomainfields[".asia"]["otheridentificationform"] = [
    "Name" => "Other identification form",
    "DisplayName" => "Other identification form",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "asiaOtherIdentificationForm",
];
/* * ************* END .ASIA ****************** */

/*
  If you intend to register .fr domains using this module make sure that the following exists in your includes/additionaldomainfields.php file,
  if not exists then add the following at the end of the file includes/additionaldomainfields.php
 */

/* * ************* START .FR****************** */
$additionaldomainfields[".fr"] = [];
$additionaldomainfields[".fr"]["holdertype"] = [
    "Name" => "Holder Type",
    "DisplayName" => "Holder Type",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "individual|Individual",
        "company|Company",
        "trademark|Trademark owner",
        "association|Association",
        "other|Other"
    ]),
    "Default" => "individual",
    "LangVar" => "frHolderType",
    "Required" => true
];

# the following fields are required when "Holder Type" is "individual"
$additionaldomainfields[".fr"]["birthdate"] = [
    "Name" => "Birth Date YYYY-MM-DD",
    "DisplayName" => "Birth Date (YYYY-MM-DD)",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frBirthDate"
];
$additionaldomainfields[".fr"]["birthcountry"] = [
    "Name" => "Birth Country Code",
    "DisplayName" => "Birth Country",
    "Options" => $countryOptsOptional,
    "Type" => "dropdown",
    "Default" => "FR",
    "Required" => false,
    "LangVar" => "frBirthCountry",
];
# the following are required only when "Birth Country Code" is "fr"
$additionaldomainfields[".fr"]["birthcity"] = [
    "Name" => "Birth City",
    "DisplayName" => "Birth City",
    "Type" => "text",
    "Size" => "20",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frBirthCity",
];
$additionaldomainfields[".fr"]["birthpostalcode"] = [
    "Name" => "Birth Postal code",
    "DisplayName" => "Birth Postal code",
    "Type" => "text",
    "Size" => "10",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frBirthPostalCode",
];

# the following fields are required when "Holder Type" is "company" or "trademark"
# the field "Name" is also required when "Holder Type" is "company" or "association" or "other"
# the field "Siren" or "Trade Mark" is also required when "Holder Type" is "other"
$additionaldomainfields[".fr"]["siren"] = [
    "Name" => "Siren",
    "DisplayName" => "SIREN",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frSiren",
];
$additionaldomainfields[".fr"]["vat"] = [
    "Name" => "VATNO",
    "DisplayName" => "VAT number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frVAT"
];

$additionaldomainfields[".fr"]["duns"] = [
    "Name" => "DUNSNO",
    "DisplayName" => "DUNS number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frDuns",
];

# the following field is also required when  "Holder Type" is "trademark"
$additionaldomainfields[".fr"]["trademark"] = [
    "Name" => "Trade Mark",
    "DisplayName" => "Trademark",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frTradeMark",
];

# the following fields are also required when "Holder Type" is "association"
$additionaldomainfields[".fr"]["waldec"] = [
    "Name" => "Waldec",
    "DisplayName" => "Waldec",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frWaldec",
];
$additionaldomainfields[".fr"]["dateofassociation"] = [
    "Name" => "Date of Association YYYY-MM-DD",
    "DisplayName" => "Date of Association (YYYY-MM-DD)",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "Langvar" => "frDateOfAssociation"
];
$additionaldomainfields[".fr"]["dateofpublication"] = [
    "Name" => "Date of Publication YYYY-MM-DD",
    "DisplayName" => "Date of Publication (YYYY-MM-DD)",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frDateOfPublication"
];
$additionaldomainfields[".fr"]["announcenumber"] = [
    "Name" => "Announce No",
    "DisplayName" => "Announcement number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frAnnounceNumber",
];
$additionaldomainfields[".fr"]["pageno"] = [
    "Name" => "Page No",
    "DisplayName" => "Page number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frPageNo",
];

# the following fields are also required when "Holder Type" is "other"
$additionaldomainfields[".fr"]["otherlegalstatus"] = [
    "Name" => "Other Legal Status",
    "DisplayName" => "Other legal status",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "frOtherLegalStatus"
];

$additionaldomainfields[".fr"]["restrictedpublication"] = [
    "Name" => "Restricted Publication",
    "DisplayName" => "Hide detais in whois (for individual only)",
    "Type" => "tickbox",
    "LangVar" => "frRestrictedPublication",
];


/* * ************* END .FR ****************** */


/*
  If you intend to register .re domains using this module make sure that the following exists in your includes/additionaldomainfields.php file,
  if not exists then add the following at the end of the file includes/additionaldomainfields.php
 */

/* * ************* START .RE/.PM/.TF/.WF/.YT ****************** */
// all same as .fr
$additionaldomainfields[".re"] = $additionaldomainfields[".fr"];
$additionaldomainfields[".pm"] = $additionaldomainfields[".fr"];
$additionaldomainfields[".tf"] = $additionaldomainfields[".fr"];
$additionaldomainfields[".wf"] = $additionaldomainfields[".fr"];
$additionaldomainfields[".yt"] = $additionaldomainfields[".fr"];
/* * ************* END .RE/.PM/.TF/.WF/.YT ****************** */

/*
  If you intend to register .it domains using this module make sure that the following exists in your includes/additionaldomainfields.php file,
  if not exists then add the following at the end of the file includes/additionaldomainfields.php
 */

/* * ************* START .IT****************** */
$additionaldomainfields[".it"] = [];
$additionaldomainfields[".it"]["legalentity"] = [
    "Name" => "Legal Entity Type",
    "DisplayName" => "Holder Type",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "1. Italian and foreign natural persons",
        "2. Companies/one man companies",
        "3. Freelance workers/professionals",
        "4. non-profit organizations",
        "5. public organizations",
        "6. other subjects",
        "7. foreigners who match 2 - 6"
    ]),
    "Default" => "1. Italian and foreign natural persons",
    "Required" => true,
    "LangVar" => "itLegalEntity"
];
$additionaldomainfields[".it"]["nationality"] = [
    "Name" => "Nationality",
    "DisplayName" => "Nationality",
    "Type" => "dropdown",
    "Options" => $countryOpts,
    "Default" => "IT",
    "Required" => true,
    "LangVar" => "itNationality",
];
$additionaldomainfields[".it"]["identificationnumber"] = [
    "Name" => "VATTAXPassportIDNumber",
    "DisplayName" => "VAT/TAX/Passport/ID Number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => true,
    "LangVar" => "itIdentificationNumber",
];
$additionaldomainfields[".it"]["whois"] = [
    "Name" => "Hide data in public WHOIS",
    "DisplayName" => "Hide data in public WHOIS",
    "Type" => "tickbox",
    "LangVar" => "itWhois",
];
$additionaldomainfields[".it"]["terms"] = [
    "Name" => "itterms",
    "DisplayName" => "Accept .it registry <a href=\"itterms.html\" target=\"_blank\">terms and conditions</a>",
    "Type" => "tickbox",
    "Required" => true,
    "LangVar" => "itTerms",
];

$additional_it_extensions = [".ag.it", ".al.it", ".an.it", ".ao.it", ".aq.it", ".ar.it", ".ap.it", ".at.it", ".av.it", ".ba.it", ".bt.it", ".bl.it", ".bn.it", ".bg.it", ".bi.it", ".bo.it", ".bz.it", ".bs.it", ".br.it", ".ca.it", ".cl.it", ".cb.it", ".ci.it", ".ce.it", ".ct.it", ".cz.it", ".ch.it", ".co.it", ".cs.it", ".cr.it", ".kr.it", ".cn.it", ".en.it", ".fm.it", ".fe.it", ".fi.it", ".fg.it", ".fc.it", ".fr.it", ".ge.it", ".go.it", ".gr.it", ".im.it", ".is.it", ".sp.it", ".lt.it", ".le.it", ".lc.it", ".li.it", ".lo.it", ".lu.it", ".mc.it", ".mn.it", ".ms.it", ".mt.it", ".vs.it", ".me.it", ".mi.it", ".mo.it", ".mb.it", ".na.it", ".no.it", ".nu.it", ".og.it", ".ot.it", ".or.it", ".pd.it", ".pa.it", ".pr.it", ".pv.it", ".pg.it", ".pu.it", ".pe.it", ".pc.it", ".pi.it", ".pt.it", ".pn.it", ".pz.it", ".po.it", ".rg.it", ".ra.it", ".rc.it", ".re.it", ".ri.it", ".rn.it", ".rm.it", ".ro.it", ".sa.it", ".ss.it", ".sv.it", ".si.it", ".sr.it", ".so.it", ".ta.it", ".te.it", ".tr.it", ".to.it", ".tp.it", ".tn.it", ".tv.it", ".ts.it", ".ud.it", ".va.it", ".ve.it", ".vb.it", ".vc.it", ".vr.it", ".vv.it", ".vi.it", ".vt.it", ".agrigento.it", ".alessandria.it", ".ancona.it", ".aosta.it", ".laquila.it", ".arezzo.it", ".ascoli-piceno.it", ".ascolipiceno.it", ".asti.it", ".avellino.it", ".bari.it", ".barletta-andria-trani.it", ".barlettaandriatrani.it", ".belluno.it", ".benevento.it", ".bergamo.it", ".biella.it", ".bologna.it", ".bolzano.it", ".brescia.it", ".brindisi.it", ".cagliari.it", ".caltanissetta.it", ".campobasso.it", ".carbonia-iglesias.it", ".carboniaiglesias.it", ".caserta.it", ".catania.it", ".catanzaro.it", ".chieti.it", ".como.it", ".cosenza.it", ".cremona.it", ".crotone.it", ".cuneo.it", ".enna.it", ".fermo.it", ".ferrara.it", ".firenze.it", ".foggia.it", ".forli-cesena.it", ".forlicesena.it", ".frosinone.it", ".genova.it", ".gorizia.it", ".grosseto.it", ".imperia.it", ".isernia.it", ".la-spezia.it", ".latina.it", ".lecce.it", ".lecco.it", ".livorno.it", ".lodi.it", ".lucca.it", ".macerata.it", ".mantova.it", ".massa-carrara.it", ".massacarrara.it", ".matera.it", ".medio-campidano.it", ".mediocampidano.it", ".messina.it", ".milano.it", ".modena.it", ".monza-brianza.it", ".monzabrianza.it", ".napoli.it", ".novara.it", ".nuoro.it", ".ogliastra.it", ".olbia-tempio.it", ".olbiatempio.it", ".oristano.it", ".padova.it", ".palermo.it", ".parma.it", ".pavia.it", ".perugia.it", ".pesaro-urbino.it", ".pesarourbino.it", ".pescara.it", ".piacenza.it", ".pisa.it", ".pistoia.it", ".pordenone.it", ".potenza.it", ".prato.it", ".ragusa.it", ".ravenna.it", ".reggio-calabria.it", ".reggiocalabria.it", ".reggio-emilia.it", ".reggioemilia.it", ".rieti.it", ".rimini.it", ".roma.it", ".rovigo.it", ".salerno.it", ".sassari.it", ".savona.it", ".siena.it", ".siracusa.it", ".sondrio.it", ".taranto.it", ".teramo.it", ".terni.it", ".torino.it", ".trapani.it", ".trento.it", ".treviso.it", ".trieste.it", ".udine.it", ".varese.it", ".venezia.it", ".verbania.it", ".vercelli.it", ".verona.it", ".vibo-valentia.it", ".vibovalentia.it", ".vicenza.it", ".viterbo.it", ".abruzzo.it", ".basilicata.it", ".calabria.it", ".campania.it", ".emiliaromagna.it", ".friuliveneziagiulia.it", ".lazio.it", ".liguria.it", ".lombardia.it", ".marche.it", ".molise.it", ".piemonte.it", ".puglia.it", ".sardegna.it", ".sicilia.it", ".toscana.it", ".trentinoaltoadige.it", ".umbria.it", ".valledaosta.it", ".veneto.it"];
foreach ($additional_it_extensions as $extension) {
    $additionaldomainfields[$extension] = $additionaldomainfields[".it"];
}
/************** END .IT*******************/

/******** START .DE*********/
$additionaldomainfields[".de"] = [];
$additionaldomainfields[".de"]["role"] = [
    "Name" => "role",
    "Options" => implode(",", [
        "PERSON|Person",
        "ORG|Organization"
    ]),
    "Default" => "PERSON",
    "DisplayName" => "Contact role",
    "Type" => "dropdown",
    "LangVar" => "deRole",
];
/******** END .DE*********/

/******** START .NL*********/
$additionaldomainfields[".nl"] = [];
$additionaldomainfields[".nl"][] = [
    "Name" => "nlLegalForm",
    "Options" => implode(",", [
        "PERSOON|Natural person",
        "BGG|Non-Dutch EC company",
        "BRO|Non-Dutch legal form/enterprise/subsidiary",
        "BV|Limited company",
        "BVI/O|Limited company in formation",
        "COOP|Cooperative",
        "CV|Limited Partnership",
        "EENMANSZAAK|Sole trader",
        "EESV|European EconomicInterest Group",
        "KERK|Religious society",
        "MAATSCHAP|Partnership",
        "NV|Public Company",
        "OWM|Mutual benefit company",
        "REDR|Shipping company",
        "STICHTING|Foundation",
        "VERENIGING|Association",
        "VOF|Trading partnership",
        "ANDERS|Other"
    ]),
    "Required" => true,
    "DisplayName" => "Legal Registration Form",
    "Type" => "dropdown",
    "LangVar" => "nlLeagalForm",
];
$additionaldomainfields[".nl"][] = [
    "Name" => "nlRegNumber",
    "DisplayName" => "Legal Registration Number (optional)",
    "Type" => "text",
    "LangVar" => "nlRegNumber",
];
/******** END .NL*********/

/******** START .SE *********/
$additionaldomainfields[".se"] = [];
$additionaldomainfields[".se"][] = [
    "Name" => "seregistrantidnumber",
    "DisplayName" => "Registrant ID Number",
    "Type" => "text",
    "Required" => "true",
    "LangVar" => "seRegistrantIdNumber"
];
$additionaldomainfields[".se"][] = [
    "Name" => "seregistrantvatid",
    "DisplayName" => "Registrant VAT ID",
    "Type" => "text",
    "LangVar" => "seRegistrantVatId"
];
/******** END .SE *********/

/******** START .TEL*********/
$additionaldomainfields[".tel"] = [];
$additionaldomainfields[".tel"][] = [
    "Name" => "telhostingaccount",
    "DisplayName" => "Hosting Account",
    "Type" => "text",
    "Required" => "true",
    "LangVar" => "telHostingAccount",
];
$additionaldomainfields[".tel"][] = [
    "Name" => "telhostingpassword",
    "DisplayName" => "Hosting Password",
    "Type" => "text",
    "Required" => "true",
    "LangVar" => "telHostingPassword",
];
$additionaldomainfields[".tel"][] = [
    "Name" => "telhidewhoisdata",
    "DisplayName" => "Hide details in WHOIS.",
    "Type" => "tickbox",
    "LangVar" => "telHideWhoisData",
];

/******** END .TEL*********/
/******** START .US*********/
$additionaldomainfields[".us"] = [];
$additionaldomainfields[".us"][] = [
    "Name" => "usnexuscategory",
    "DisplayName" => "Nexus Category",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "C11|US Citizen",
        "C12|US Permanent Resident",
        "C21|US Organization",
        "C31|Foreign Organization doing business in US",
        "C32|Foreign Organization with US Office"
    ]),
    "LangVar" => "usNexusCategory",
];
$additionaldomainfields[".us"][] = [
    "Name" => "uspurpose",
    "DisplayName" => "Application Purpose",
    "Type" => "dropdown",
    "Options" => implode(",", [
        "P3|Personal use",
        "P1|Business for profit",
        "P2|Non-profit",
        "P4|Educational",
        "P5|Governmental"
    ]),
    "LangVar" => "usPurpose"
];
$additionaldomainfields[".us"][] = [
    "Name" => "usnexuscountry",
    "DisplayName" => "Nexus Country",
    "Type" => "dropdown",
    "Options" => $countryOpts,
    "LangVar" => "usNexusCountry"
];
/******** END .US*********/

/******** START .ES*********/
$additionaldomainfields[".es"] = [];
$additionaldomainfields[".es"][] = [
    "Name" => "estldidformtype",
    "DisplayName" => "ID Form Type",
    "LangVar" => "estldidformtype",
    "Type" => "dropdown",
    "Options" => implode(',', [
        '1|NIF/DNI',
        '3|NIE',
        '0|Other Identification',
    ]),
    "Default" => "1|NIF/DNI",
];
$additionaldomainfields[".es"][] = [
    "Name" => "estldidformnum",
    "DisplayName" => "ID Form Number",
    "LangVar" => "estldidformnum",
    "Type" => "text",
    "Size" => "10",
    "Default" => "",
    "Required" => true
];
$additionaldomainfields[".es"][] = [
    "Name" => "estldlegalform",
    "DisplayName" => "Legal Form",
    "LangVar" => "estldlegalform",
    "Type" => "dropdown",
    "Options" => implode(',', [
        '1|Individual',
        '39|Economic Interest Grouping',
        '47|Association',
        '59|Sports Association',
        '68|Professional Association',
        '124|Savings Bank',
        '150|Community Property',
        '152|Community of Owners',
        '164|Order or Religious Institution',
        '181|Consulate',
        '197|Public Law Association',
        '203|Embassy',
        '229|Local Authority',
        '269|Sports Federation',
        '286|Foundation',
        '365|Mutual Insurance Company',
        '434|Regional Government Body',
        '436|Central Government Body',
        '439|Political Party',
        '476|Trade Union',
        '510|Farm Partnership',
        '524|Public Limited Company',
        '554|Civil Society',
        '560|General Partnership',
        '562|General and Limited Partnership',
        '566|Cooperative',
        '608|Worker-owned Company',
        '612|Limited Company',
        '713|Spanish Office',
        '717|Temporary Alliance of Enterprises',
        '744|Worker-owned Limited Company',
        '745|Regional Public Entity',
        '746|National Public Entity',
        '747|Local Public Entity',
        '877|Others',
        '878|Designation of Origin Supervisory Council',
        '879|Entity Managing Natural Areas',
    ]),
    "Default" => "1|Individual",
];
/******** END .ES*********/

/******** START .RP*********/
$additionaldomainfields[".ro"] = [];
$additionaldomainfields[".ro"]["vat"] = [
    "Name" => "VAT Number",
    "DisplayName" => "VAT Number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "roVAT",
    "Description" => "(required for Companies only) <small>*optional</small>"
];
$additionaldomainfields[".ro"]["companynumber"] = [
    "Name" => "Registration Number",
    "DisplayName" => "Company Number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "roCompanyNumber",
    "Description" => "(required for Companies only) <small>*optional</small>"
];
$additionaldomainfields[".ro"]["identificationnumber"] = [
    "Name" => "CNPFiscalCode",
    "DisplayName" => "ID Card or Passport Number",
    "Type" => "text",
    "Size" => "30",
    "Default" => "",
    "Required" => false,
    "LangVar" => "roIdentificationNumber",
    "Description" => "(required for Individuals only) <small>*optional</small>"
];
/******** END .RO*********/

/******** START .DK*********/
$additionaldomainfields[".dk"] = [];
$additionaldomainfields[".dk"]["registranttype"] = [
    "DisplayName" => "Owner type",
    "Name" => "X-DK-USER-TYPE",
    "Required" => false,
    "Type" => "dropdown",
    "Options" => "PERSON|Person,COMPANY|Company,ASSOCIATION|Association,PUBORG|Public Organization",
    "Default" => "",
    "LangVar" => "dkRegistrantType",
];
$additionaldomainfields[".dk"]["registrantidnumber"] = [
    "DisplayName" => "Identification Number for companies (EAN, CVR or pnumber)",
    "Name" => "X-DK-USER-ID-NUMBER",
    "Required" => true,
    "Type" => "text",
    "Description" => "Identification Number of the Ownercontact, can be EAN, CVR or pnumber.",
    "LangVar" => "dkregistrantidnumber",
];
$additionaldomainfields[".dk"]["acknowledgement"] = [
    "DisplayName" => ".DK acknowledgement",
    "Name" => "X-DK-ACCEPT-TAC",
    "Required" => true,
    "Type" => "dropdown",
    "Description" => "I accept the user agreement with Punktum dk A/S.
    <ul class=\"list-group mb-2\" style=\"margin-top:8px;\">
        <li class=\"list-group-item py-2 px-3\">
            <span class=\"mr-2\" style=\"font-weight:bold;\">&#128279;</span>
            <a href=\"https://www.punktum.dk/en/articles/terms-and-conditions-for-the-right-of-use-to-a-dk-domain-name\" target=\"_blank\" class=\"font-weight-bold\" style=\"color:#007bff;\">Terms and conditions for the right of use to a .dk domain name</a>
        </li>
        <li class=\"list-group-item py-2 px-3\">
            <span class=\"mr-2\" style=\"font-weight:bold;\">&#128279;</span>
            <a href=\"https://www.punktum.dk/en/articles/privacy-policy\" target=\"_blank\" class=\"font-weight-bold\" style=\"color:#007bff;\">Privacy Policy</a>
        </li>
        <li class=\"list-group-item py-2 px-3\">
            <span class=\"mr-2\" style=\"font-weight:bold;\">&#128279;</span>
            <a href=\"https://www.punktum.dk/en\" target=\"_blank\" class=\"font-weight-bold\" style=\"color:#007bff;\">About Punktum dk A/S</a>
        </li>
    </ul>",
    "Options" => "1|Yes,0|No",
    "Default" => "",
    "LangVar" => "dkAcknowledgement",
];
