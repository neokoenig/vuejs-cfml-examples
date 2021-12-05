<cfscript>
header name="Content-Type" value="application/json";
data = [
    "Message 1",
    "Message 2",
    "Message 3",
];
writeOutput(serializeJSON(data));
</cfscript>