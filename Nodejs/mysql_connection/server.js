const express = require('express');
const mysql = require('mysql2');

const app = express();

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "Vithu@54218",
    database: "product"
});

app.get("/nationality", (req, res) => {
    const sql = "select * from nationality"; 
   //const sql = "create table id_type (tid varchar(100), field_code varchar(100), name varchar(100));";
    db.query(sql, (err, data)=>{
        console.log(req);
        if(err){
            return res.json(err);
        }else{
            return res.json(data);
        }
    });
});

app.listen(8081,() => {
    console.log("listen..");
});