const express = require('express');
const { default: Surreal } = require('surrealdb.node');

const db = new Surreal();
const app = express();
async function main() {

  try {
      // Connect to the database
      await db.connect('ws://127.0.0.1:8000');

      // Signin as a namespace, database, or root user
      await db.signin({
          user: 'root',
          pass: 'root',
      });

      // Select a specific namespace / database
      await db.use({ ns: 'test', db: 'test' });

      // Perform a custom advanced query
      let groups = await db.query('select * from user:baher->has->transactions->contains->node');

  } catch (e) {

      console.error('ERROR', e);

  }

}

main()
app.get('/', (req, res) => {
  res.send('Successful response.');
});
