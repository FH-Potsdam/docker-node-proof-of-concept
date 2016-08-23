const express = require('express');
const path = require('path');
const port = 8080;
const app = express();
app.use(express.static(path.join(__dirname, 'public')));
app.set('port', port);
console.log('Magic happens on http://localhost:' + port);
app.listen(port);
