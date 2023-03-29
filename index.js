import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser';
import { pool }  from './db.js'
import JSONbig from 'json-bigint'
import { TerminalInfo } from './model/terminal.js';
const app = express();
const port = 3000;

pool.getConnection().then(conn => {
    console.log("Connected to MariaDB!");
  })
  .catch(err => {
    console.log("Error connecting to MariaDB: ", err);
  });

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors());
// Create
app.post('/api/terminal', async (req, res) => {
    let data = req.body;
 
    const terminalobj = new TerminalInfo(data)
    let conn = await pool.getConnection();

    conn.query("INSERT INTO TERMINAL_INFO (TERM_ID, BRANCH, VENDORNO, PRODUCTNO, PMINO, BATCH, SLIPNO, TERM_NAME, TERM_FOOD, PAYPERCENT, PAYPERDAY, INCLUDEVAT, INV_PRINT, INV_NAME, INV_ADDR, TERM_FLAG, TYPEPAY, STAFFOFCHARGE, STAFFPRODUCTNO, CUSTOMER_REF, RENTAL_ID, HORIZON_SENT, LEASE_TYPE, CLUBCARD_CODE, CLUBCARD_AMT, CLUBCARD_POINT, TERMINAL_TYPE) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",[terminalobj.TERM_ID, terminalobj.BRANCH, terminalobj.VENDORNO, terminalobj.PRODUCTNO, terminalobj.PMINO, terminalobj.BATCH, terminalobj.SLIPNO, terminalobj.TERM_NAME, terminalobj.TERM_FOOD, terminalobj.PAYPERCENT, terminalobj.PAYPERDAY, terminalobj.INCLUDEVAT, terminalobj.INV_PRINT, terminalobj.INV_NAME, terminalobj.INV_ADDR, terminalobj.TERM_FLAG, terminalobj.TYPEPAY, terminalobj.STAFFOFCHARGE, terminalobj.STAFFPRODUCTNO, terminalobj.CUSTOMER_REF, terminalobj.RENTAL_ID, terminalobj.HORIZON_SENT, terminalobj.LEASE_TYPE, terminalobj.CLUBCARD_CODE, terminalobj.CLUBCARD_AMT, terminalobj.CLUBCARD_POINT, terminalobj.TERMINAL_TYPE]).then(rows => {
        console.log(rows)
        res.set('Content-Type', 'application/json');
        res.send("INSERTT!!!")
        conn.release()
    }).catch(err =>{
        console.log("Error executing query: ", err);
        conn.release();
    })
    
});
// GET ALL
app.get('/api/terminal', async (req, res) => {
    let conn = await pool.getConnection();
    conn.query("SELECT * FROM TERMINAL_INFO")
    .then(rows => {
      console.log(rows);
      
      res.set('Content-Type', 'application/json');
      res.send(JSONbig.stringify(rows))
      conn.release(); 
      
    })
    .catch(err => {
      console.log("Error executing query: ", err);
      conn.release();
    });
});

app.get('/api/terminal/:term_id', async (req, res) => {
    let conn = await pool.getConnection();
    var term_id = req.params.term_id;
    conn.query("SELECT * FROM TERMINAL_INFO where term_id = ?", [term_id])
    .then(rows => {
      console.log(rows);
     
      res.set('Content-Type', 'application/json');
      res.send(JSONbig.stringify(rows))
      conn.release(); 
      
    })
    .catch(err => {
      console.log("Error executing query: ", err);
      conn.release();
    });
});

// Update
app.put('/api/terminal', async (req, res) => {
    let conn = await pool.getConnection();
    let {TERM_ID, TERMINAL_TYPE} = req.body;
    console.log(TERM_ID, TERMINAL_TYPE)
    conn.query("UPDATE TERMINAL_INFO SET TERMINAL_TYPE = ? WHERE TERM_ID = ? ", [TERMINAL_TYPE, TERM_ID]).then(rows =>{
        console.log(rows)
        res.set('Content-Type', "application/json")
        res.send("UPDATE!!!")
    }).catch(err=>{
        console.log(err)
    })
});

// Delete
app.delete('/api/terminal/:term_id', async (req, res) => {
    let conn = await pool.getConnection();   
    let term_id = req.params.term_id
    conn.query("Delete from TERMINAL_INFO where TERM_ID = ? ", term_id).then(rows => {
        console.log(rows)
        res.send("Delete")
    }).catch(err => {
        console.log(err)
    })
});
app.put("/api/update", async (req, res) => {

    let conn = await pool.getConnection();
    
    conn.query("select * from test_table").then(rows =>{
        rows.forEach(element => {
            
            if(element.MAX > element.MIN){
                conn.query("UPDATE TEST_TABLE SET MIN = ?", element.MIN+1).then(row =>{
                    console.log(element.ITEMCODE + " increte")
                    // addlog(element.ITEMCODE, element.ITEMNAME, element.MIN+1, new Date(), new Date())
                }).catch(err =>{
                    console.log(err)
                })
            }else{
                console.log(element.ITEMCODE + " not complate")
                
            }
            
            
        });
        res.send("UPDATE!!!!")
    }).catch(err =>{

        console.log(err)
        
        conn.release();
        res.status(500).send("Internal Server Error");
    })
})
// async function addlog(ITEMCODE, ITEMNAME, QTY, CREATE_DATE, UPDATE_DATE){
//     let conn = await pool.getConnection();
//     conn.query("insert into TEST_LOGS (ITEMCODE, ITEMNAME, QTY, CREATE_DATE, UPDATE_DATE) VALUES (?,?,?,?,?)", [ITEMCODE, ITEMNAME, QTY, CREATE_DATE, UPDATE_DATE]).then(rows =>{
//         console.log(rows)
//     })
// }
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
  })