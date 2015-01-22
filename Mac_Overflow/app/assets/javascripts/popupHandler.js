/* for one function it's not really helpful to put it in a separate file,
 * unless you're just trying to demonstrate asset pipeline behavior? 
 *
 * Also this function has a bad name, a popupHandler, what's that do?
 *
 * Make your function tell me what it achieves, not how you understand its
 * role.  Which popup, how many are there?  Halp!
 */
function popupHandler(title, genre) {
	$('#popup_title').html(title);
	$('#popup_genre').html(genre);
	$('#entry_title').val(title);
	$('#entry_genre').val(genre);

}
