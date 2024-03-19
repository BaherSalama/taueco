const express = require('express');
const { Surreal } = require('surrealdb.node');

const db = new Surreal();
const app = express();
async function check_conn() {
  try {
      // Connect to the database
      await db.connect('ws://127.0.0.1:8000');
      // Signin as a namespace, database, or root user
      await db.signin({
        username: 'root',
        password: 'root',
      });
      // Select a specific namespace / database
      await db.use({ ns: 'test', db: 'test' });
      let groups = await db.query('select * from user:baher->has->transactions->contains->node');
      console.log(groups)
      return true
  } catch (e) {
      console.error('ERROR', e);
      return false
  }

}
async function query(){
  let groups = await db.query('select * from user:baher->has->transactions->contains->node');
  return groups
}



check_conn()




// app.get('/', (req, res) => {
//   res.send('Successful response.');
// });
