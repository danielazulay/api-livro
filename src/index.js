const express =require('express');
const bodyParser =require('body-parser');


const app =express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended : false}));


require('./controller/login')(app);
require('./controller/cadastro')(app);

require('./controller/cria-livro')(app);
require('./controller/lista-de-livro')(app);
app.listen(3000);