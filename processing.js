const mysql = require('mysql')
const moment = require('moment')



let con = mysql.createConnection({
  host: "localhost",
  user: "root",
	password: "",
	database: "db_mca_freddy"
})

con.connect(err => {
	if(err){
		throw err
	} else {
		console.log("Database terkoneksi")
	}
})


setInterval(() => {
	//menselect inbox yang status nya 0 (belum diproses)
	con.query("SELECT * FROM inbox WHERE status=0", function (err, result) {
		if (err) throw err;
		console.log("TOTAL INBOX [Status 0] = "+result.length)
		if(result.length){
			//perulangan setiap inbox
			result.forEach(inbox => {
				//split pesan
				let arrPesan = inbox.pesan.split("#")
				let query = `SELECT * FROM processing WHERE kode LIKE '${arrPesan[0]}%'`
				//mencari processing sesuai dengan pesan
				con.query(query, function (err, result) {
					if (err) throw err;
					if(result.length > 0){
						let process = result[0]
						let arrQuery = process.query.split("?")
						let queryFinal = ""
						arrQuery.forEach((e, i) => {
							queryFinal += e
							if(i < arrPesan.length-1)
								queryFinal += arrPesan[i+1].trim()
						})
						con.query(queryFinal, function (err, result) {
							let pesanOutbox = ""
							//select
							if(process.tipe == 1){
								pesanOutbox = `Data Player\n\n`
								result.forEach(e => {
									pesanOutbox += `Nama\t: ${e.nama}\nNick\t: ${e.nickname}\nUmur\t: ${e.umur}\nAsal\t: ${e.asal}\n\n`
								})
							}
							//insert
							else if(process.tipe == 2){
								pesanOutbox = `Tambah Player Berhasil\n\n`
								pesanOutbox += `Nama\t: ${arrPesan[1]}\nNick\t: ${arrPesan[2]}\nUmur\t: ${arrPesan[3]}\nAsal\t: ${arrPesan[4]}\n\n`
							}
							//delete
							else if(process.tipe == 4){
								pesanOutbox = `Hapus Player Berhasil\n\n`
								pesanOutbox += `Nick\t: ${arrPesan[1]}`
							}

							let queryInsert = `INSERT INTO outbox(account_id, message_id, pesan, waktu_masuk) 
								VALUES (${inbox.account_id}, 
									${inbox.message_id}, 
									'${pesanOutbox}', 
									'${moment(inbox.waktu_masuk, 'ddd, DD MMM YYYY HH:mm:ss').format("YYYY-MM-DD hh:mm:ss")}')`
							//console.log("query insert : "+queryInsert)
							con.query(queryInsert, function (err, result) {
								if (err) throw err;
								console.log(`Pesan INBOX [${inbox.message_id}] => OUTBOX : ${queryFinal}`)
							})
						})
					}
				})
			})
		}
	})
}, 2000)

