let command;
let rondom;
const btn = document.getElementById('btn');
const reset = document.querySelector('#reset');
console.log("dom");
let swith = true;
let atc;
let hp;
let enemy = 10;
const list = document.querySelector('#list');
const escape = document.querySelector('#suraimu');
let count = 0;



btn.addEventListener('click', () => {
  console.log('体力' + enemy);
  const vs = () => {
  random = Math.floor(Math.random() * 10);
  command = prompt('敵が現れた！　（　1⃣　攻撃　2⃣　逃がしてあげる) ');
    if(command == '1') {
      atc = document.createElement('li');
      atc.textContent = random + 'の攻撃';
      list.appendChild(atc);
      enemy = enemy-random;
      if(enemy > 0) {
        hp = document.createElement('li');   
        hp.textContent = '敵の体力は' + enemy;
        list.appendChild(hp);
      }else {
        h3 = document.createElement('h3');
        h3.textContent = '敵をたおしました！';
        list.appendChild(h3);
      }
    }
    if(command == '2') {
      exit = document.getElementById('exit');
      h3 = document.createElement('h3');
      h3.textContent = '敵は逃げました';
      exit.appendChild(h3);
      const timer = setInterval(() => {
        escape.style.paddingLeft = count + 'px';
        count++;
      
        if(count >= 1200) clearInterval(timer);
      },1);
    }
  }
  if(enemy > 0) {
    vs();
    console.log('体力終了' + enemy);
  }
});

reset.addEventListener('click', () => {
  enemy = 10;
  console.log('体力復活' + enemy);
  alert('敵の体力がリセットされました');
});