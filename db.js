import mariadb from 'mariadb';

const pool = mariadb.createPool({
  host: '127.0.0.1',
  user: 'root',
  password: 'root',
  database: 'JOB_INTERVIEW'
});


export {pool};