const b = require('bcryptjs');
const h = b.hashSync('saiu123', 10);
console.log('hash=', h, 'len=', h.length);
console.log('confere?', b.compareSync('saiu123', h));
