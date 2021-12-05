<html>
    <head>
        <title>Vue Example 3</title>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    </head>
    <body>
        <div id="app">
            <ul v-if="users.length">
                <li v-for="user in users">
                    {{ user.id }} {{ user.name }} {{ user.role }}
                </li>
            </ul>
            <br />
            <button @click="getData">Get Users</button>
        </div>
        <script>
        var app = new Vue({
            el: '#app',
            data: {
                users: []
            },
            methods: {
                getData: function() {
                    axios.get('remote.cfm')
                    .then(function(response) {
                        app.users = response.data;
                    })
                    .catch(function(error) {
                        console.log(error);
                    });
                }
            }
        });
        </script>
    </body>
</html>
