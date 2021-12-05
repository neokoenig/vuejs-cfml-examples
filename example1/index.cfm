<html>
    <head>
        <title>Vue Example 1</title>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    </head>
    <body>
        <div id="app">
            {{ message }}
            <br />
            <button @click="getData">Get Message</button>
        </div>
        <script>
        var app = new Vue({
            el: '#app',
            data: {
                message: 'Hello Vue!'
            },
            methods: {
                getData: function() {
                    axios.get('remote.cfm')
                    .then(function(response) {
                        app.message = response.data.message;
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
