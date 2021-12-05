<cfscript>
header name="Content-Type" value="application/json";
data = queryNew(
    "id,name,role",
    "integer,varchar,varchar",
    [
        {"id"=1, name="Joe", role="admin"},
        {"id"=2, name="Jane", role="user"},
        {"id"=3, name="John", role="user"}
    ]
);
writeOutput(serializeJSON(data, "struct"));
</cfscript>