const Discord = require("discord.js")
const mysql = require('mysql')
const moment = require('moment')
const {prefix, token} = require("./config.json")


let con = mysql.createConnection({
  host: "localhost",
  user: "root",
	password: "",
	database: "db_mca_freddy"
})

//bot dijalankan
const client = new Discord.Client()
client.once("ready", () => {
	console.log(`Client ${client.user.username} siap`)
})


//ngecek db
con.connect(err => {
	if(err){
		throw err
	} else {
		console.log("Database terkoneksi")
	}
})

//bot menerima pesan
client.on("message", message => {
	//memasukan ke inbox
	let queryInsert = `INSERT INTO inbox(message_id, pesan, account_id, waktu_masuk) 
		VALUES (${message.id}, '${message.content}', ${message.author.id}, '${moment().format('YYYY-MM-DD hh:mm:ss')}')`;
	con.query(queryInsert, function (err, result) {
		if (err) throw err;
		console.log(`Pesan [${message.id}] => INBOX`)
	})
})

client.login(token)