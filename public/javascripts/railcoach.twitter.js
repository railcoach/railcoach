(function ($) {
	$.fn.railcoachTwitterWidget = function(options) {
		var options = $.extend({
			username: 'projectlodge',
            count: 5,
            showTweetFeed: {
                showProfileImages: true,
                showUserScreenNames: true,
                showSource: true,
                paging: {
                    mode: 'endless-scroll'
                },
                showTimestamp: {
                    refreshInterval: 15
                },
                autorefresh: {
                    mode: 'trigger-insert',
                    interval: 30
                }
            },
            onDataRequestHandler: function(stats) {
                if (stats.dataRequestCount < 11) {
                    return true;
                }
            }
		}, options);

        $(this.selector).jTweetsAnywhere(options);
	};
})(jQuery);