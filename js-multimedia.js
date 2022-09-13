jQuery('.link-video-ug').on('click', function(){
	if (jQuery(this).hasClass('video-mobil')) {
		jQuery('body,html').animate({
            scrollTop: 75
        }, 800);
	}
	let parent = jQuery(this).attr('href');
	let url = jQuery(parent).attr('data-url');
	jQuery("#video-ug").remove();
	jQuery(parent).prepend( '<iframe id="video-ug" src="'+url+'" frameborder="0" allowfullscreen></iframe>' );
});

jQuery('.link-video-modal-ug').on('click', function(){
	let parent = jQuery(this).attr('href');
	let url = jQuery(parent).attr('data-url');
	jQuery("#video-ug").remove();
	jQuery(parent).prepend( '<iframe id="video-ug" src="'+url+'" frameborder="0" allowfullscreen></iframe>' );
});

jQuery('.link-modal-ug').on('click', function(){
	jQuery("#video-ug").remove();
	jQuery('.link-video-modal-ug:first').click();
})