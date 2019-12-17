const Discord = require("discord.js")
const mysql = require('mysql')
const moment = require('moment')
const {token, channelID} = require("./config.json")


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
	setInterval(() => {
		//menselect inbox yang status nya 0 (belum diproses)
		con.query("SELECT * FROM outbox WHERE status_dikirim=0", function (err, result) {
			if (err) throw err;
			console.log("TOTAL OUTBOX [Status Kirim 0] = "+result.length)
			if(result.length){
				result.forEach(outbox => {
					client.channels.get(channelID).send(outbox.pesan)
					let queryUpdate = `UPDATE outbox SET status_dikirim=1, waktu_kirim='${moment().format('YYYY-MM-DD hh:mm:ss')}' 
					WHERE message_id=${outbox.message_id} AND account_id=${outbox.account_id}`;
					console.log("query update :"+queryUpdate)
					con.query(queryUpdate, function (err, result) {
						if (err) throw err;
						console.log(`Pesan OUTBOX [${outbox.message_id}] => TERKIRIM`)
					})
				})
			}
		})
	}, 2000)
})



con.connect(err => {
	if(err){
		throw err
	} else {
		console.log("Database terkoneksi")
	}
})



client.login(token)