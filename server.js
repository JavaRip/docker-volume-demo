import express from 'express';
import fs from 'fs';
const app = express();
const OUTDIR = 'output';

app.get('/save-time', (_req, res) => {
  const filename = `${OUTDIR}/output.txt`;
  const data = `the time is ${Date.now()} \n`;
  console.log(`writing ${data} to ${filename}`);
  fs.appendFileSync(filename, data);
  const fileContents = fs.readFileSync(filename, 'utf-8');
  console.log('FILE CONTENTS');
  console.log('------------------');
  console.log(fileContents)
  console.log('==================');
  res.send(`time saved: ${data} to ${filename}`);
});

app.listen(3000);
console.log('listeneing on 3000');
