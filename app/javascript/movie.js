
window.addEventListener('load', function(){

document.getElementById("test").addEventListener("click",function(){
  setTimeout(function(){

    result = prompt('この映画のキャッチフレーズを入力してください')
   if ( result === `${gon.movie.phrase}`) {
        alert('正しく入力されました');
    }
    else {
        alert(`正解は[${gon.movie.phrase}]です`);
    }
  },2000);
});
})

