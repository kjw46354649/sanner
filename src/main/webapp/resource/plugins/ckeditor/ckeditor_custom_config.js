/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	config.toolbar = [
        ['Font', 'FontSize'],
        ['BGColor', 'TextColor' ],
        ['Bold', 'Italic', 'Strike', 'Underline', 'RemoveFormat'],
        ['SpecialChar', 'Smiley','Source'],
        // ['Image', 'SpecialChar', 'Smiley','Source'],
        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
        ['NumberedList', 'BulletedList'],
        // ['Source']
    ],
    config.height='300px';
    config.filebrowserUploadMethod = 'form';
    config.allowedContent = true;
    config.resize_enabled = false;
};
