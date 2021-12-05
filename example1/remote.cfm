<cfscript>
header name="Content-Type" value="application/json";
data = {
    "message" = "Hi from CFML! The time is #now()#"
};
writeOutput(serializeJSON(data));
</cfscript>