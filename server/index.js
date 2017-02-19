import express from 'express';
import path from 'path';

const app = express();

app.set('view engine', 'pug');
app.set('views', path.join(__dirname));
app.use(express.static(path.join(process.cwd(), 'public')));

app.get('/', (req, res) => res.render('index'));
app.get('/api', (req, res) => { res.send('this is the API!!!!!') });

app.listen(3000, () => {
  console.log('Get your weather on http://localhost:3000!');
});
