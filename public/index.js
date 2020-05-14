document.querySelector(".content a").addEventListener("click",function(){
    var selectedRadio;
    if(document.querySelector('input[value="doctor"]').checked)
    selectedRadio=document.querySelector('input[value="doctor"]');
    if(document.querySelector('input[value="patient"]').checked)
    selectedRadio=document.querySelector('input[value="patient"]');
    if(document.querySelector('input[value="nurse"]').checked)
    selectedRadio=document.querySelector('input[value="nurse"]');
    if(document.querySelector('input[value="boardMember"]').checked)
    selectedRadio=document.querySelector('input[value="boardMember"]');
    if(document.querySelector('input[value="other"]').checked)
    selectedRadio=document.querySelector('input[value="other"]');
    this.href=selectedRadio.id;
});

var buttons=document.querySelectorAll(".content label");
var i;
for(i=0;i<buttons.length;i++)
{
buttons[i].addEventListener("click",function(){
    this.classList.toggle("pressed");
});
}
