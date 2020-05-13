const defaults = {
    rotate: true,
    rotateAngle: 0,
    appendRotateControlsTo: '.lg-toolbar'
}

/**
 * Creates the rotate plugin.
 * @param {object} element - lightGallery element
 */
var Rotate = function(element) {
    this.core = $(element).data('lightGallery');
    this.$el = $(element);

    this.core.s = $.extend({}, defaults, this.core.s);
    this.init();
    return this;
}

Rotate.prototype.init = function() {
    var _this = this;
    if (this.core.s.rotate) {
        // append rotate controls
        _this.controls();
    }
}

// Manage rotate via rotate buttons
Rotate.prototype.controls = function() {

    const setRotate = function ($image, rotationAngle) {
        $image.css('transform', 'rotate(' + rotationAngle + 'deg)');
    }

    var _this = this;
    var _html = '<span class="lg-rotate lg-icon"></span>';

    // Append rotate controls
    $(this.core.s.appendRotateControlsTo).append(_html);

    _this.core.$outer.find('.lg-rotate').on('click.lg', function() {
        // Get the current element
        var $image = _this.core.$slide.eq(_this.core.index).find('.lg-image');
        const angle = parseInt($image.attr('data-rotate')) + 90;

        setRotate($image, angle);
        $image.attr('data-rotate', angle);
    });

    // Add rotate class
    _this.core.$el.on('onSlideItemLoad.lg.tm onBeforeSlide.lg.tm', function(event, index) {
        const angle = _this.core.s.rotateAngle;
        var $image = _this.core.$slide.eq(index).find('.lg-image');

        setRotate($image, angle);
        $image.attr("data-rotate", angle)
    });
};

Rotate.prototype.destroy = function() {};

$.fn.lightGallery.modules.rotate = Rotate;