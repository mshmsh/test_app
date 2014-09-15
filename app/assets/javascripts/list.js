$(function() {

	$(".headroom").headroom({
		"tolerance": 20,
		"offset": 50,
		"classes": {
			"initial": "animated",
			"pinned": "slideDown",
			"unpinned": "slideUp"
		}
	});

});
$(function () {
        if ($('html').hasClass('csstransforms3d')) {
            $('.artGroup').removeClass('slide').addClass('flip');
            $('.artGroup.flip').hover(
                function () {
                    $(this).find('.artwork').addClass('theFlip');
                },
                function () {
                    $(this).find('.artwork').removeClass('theFlip');
                }
            );
        } else {
            $('.artGroup').hover(
                function () {
                    $(this).find('.detail').stop().animate({bottom:0}, 500, 'easeOutCubic');
                },
                function () {
                    $(this).find('.detail').stop().animate({bottom: ($(this).height() * -1) }, 500, 'easeOutCubic');
                }
            );

        }

    });