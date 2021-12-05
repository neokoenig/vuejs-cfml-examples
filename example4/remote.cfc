component output="false" {

	remote function get() {
		return this.respond();
	}

	remote function add() {
		this.setup();
		session.items.push({
			"name": request.data.item,
			"created": DateTimeFormat(now())
		});
		return this.respond();
	}

	remote function remove() {
		this.setup();
		ArrayDeleteAt(session.items, url.position);
		return this.respond();
	}

	remote function clear(){
		this.setup();
		session.items = [];
		return this.respond();
	}

	private function setup(){
		if(!structKeyExists(session, "items"))
			session.items = [];
		if (cgi.content_type EQ "application/json")
    		request.data = deserializeJSON(ToString(getHTTPRequestData().content));
	}

	private function respond(){
		header name="Content-Type" value="application/json";
		return structKeyExists(session, "items") && isArray(session.items) ? session.items : [];
	}

}