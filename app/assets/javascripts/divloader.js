/*$(document).on('click', 'button', 
  function(){
  	// Remove current class

    var selection = $(this)
  	console.log('');

    var modal = document.querySelector('modal');
    console.log(modal);

    //var modal = document.getElementById('modal-body');
    //modal.innerHTML = $(this.innerHTML);



    /*if($(this).hasClass('col-md-12 tweet')){
    
  		$(this).removeClass();
  		// Add small class
  		$(this).addClass('col-md-6 tweet');
  		
    } else {
                
  		$(this).removeClass();
  		
  		// Add wide class
  		$(this).addClass('col-md-12 tweet');
    }
});*/

$(window).load(function(){

    $('button').click(function () {

      console.log($(this).id);

        console.log($(this).children().children().html());
        var comment = $(this).children().children().html();
        console.log(comment);
      // console.log(document.getElementById('modalBody2'));
  

       var modal = document.getElementById('modalBody1');
       console.log(modal)
       
       
       var modal2 = document.getElementById('modalBody2');
       console.log(modal2)
       var modal3 = document.getElementById('modalBody3');
console.log(modal3)
       if (modal == undefined || modal == null ){
          

       } else {
        modal.innerHTML = comment;

       }
              if (modal2 == undefined || modal2 == null ){
          

       } else {
        modal2.innerHTML = comment;
 
       }

       if (modal3 == undefined || modal3 == null ){
          

       } else {
        modal3.innerHTML = comment;
     
       }



       /*else if (  modal2 != undefined ^ modal2 != null){
         modal2.innerHTML = comment
      } else if (modal3 != undefined ^ modal3 != null){
        modal3.innerHTML = comment
      } else {
        console.log('somethings wrong');
      }

      console.log("hello")*/
    });
});
