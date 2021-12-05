<html>
    <head>
        <title>Vue Example 2</title>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    </head>
    <body>
        <div id="app">
            <ul v-if="messages.length">
                <li v-for="msg in messages">
                    {{ msg }}
                </li>
            </ul>
            <br />
            <button @click="getData">Get Messages</button>
        </div>
        <script>
        var app = new Vue({
        el: '#app',
        data: {
            messages: []
        },
        methods: {
            getData: function() {
                 axios.get('remote.cfm')
                .then(function(response) {
                    app.messages = response.data;
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
