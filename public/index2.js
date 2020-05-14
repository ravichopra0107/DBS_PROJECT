var buttonsArr=document.querySelectorAll('input[type="radio"]');
var i;
for(i=0;i<buttonsArr.length;i++)
{
    buttonsArr[i].addEventListener("click",function(){
    document.querySelector(".section2").style.display="block";
});
}
var buttons=document.querySelectorAll("label");
var i;
for(i=0;i<buttons.length;i++)
{
buttons[i].addEventListener("click",function(){
    this.classList.toggle("pressed");
});
}
