<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <title>Vue Example 4</title>
  </head>
  <body class="bg-light">
    <div id="todolist" class="container mt-5 table-responsive">
        <div class="row">
            <div class="col-md-6 offset-md-3 shadow bg-white p-3 mb-5">
                <div v-if="!items.length" class="alert alert-primary" role="alert">
                    No items found
                </div>
                <div v-if="errors.length" class="alert alert-danger" role="alert">
                    <p v-for="e in errors">{{ e }}</p>
                    <button class="btn btn-danger" @click="errors = []">Dismiss</button>
                </div>
                <div v-if="items.length" class="list-group mb-1">
                    <button v-for="(item, i) in items"
                        type="button"
                        class="list-group-item list-group-item-action"
                        :key="i"
                        @click="removeItem(i+1)">
                        <span>{{ i + 1 }} {{ item.created }}
                        <span>{{ item.name }}</span>
                    </button>
                </div>
                <div class="btn-toolbar mb-2 mt-2 justify-content-between">
                    <div class="input-group">
                        <input v-model="newItem" type="text" class="form-control" placeholder="... Item Name" />
                    </div>
                    <div class="btn-group">
                        <button class="btn btn-primary" :disabled="!newItem" @click="addItem">Add Item</button>
                        <button class="btn btn-danger" :disabled="!items.length" @click="clearAllItems">Clear All</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    const api = axios.create({
        timeout: 5000
    });
    api.interceptors.response.use((response) => response, (error) => {
        app.errors.push(error.message);
    });
    var app = new Vue({
        el: '#todolist',
        data: {
            items: [],
            errors: [],
            newItem: null
        },
        mounted: function() {
            this.getItems();
        },
        methods: {
            getItems: function() {
                api.get('remote.cfc?method=get')
                .then(function(response) {
                    app.items = response.data;
                })
            },
            addItem: function() {
                api.post('remote.cfc?method=add', {
                    item: this.newItem
                })
                .then(function(response) {
                    app.items = response.data;
                    app.newItem = null;
                })
            },
            removeItem: function(position) {
                api.delete('remote.cfc?method=remove&position=' + position)
                .then(function(response) {
                    app.items = response.data;
                })
            },
            clearAllItems: function() {
                api.delete('remote.cfc?method=clear')
                .then(function(response) {
                    app.items = response.data;
                    app.errors = [];
                })
            }
        }
    });
    </script>
  </body>
</html>