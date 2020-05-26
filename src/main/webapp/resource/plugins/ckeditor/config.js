/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	config.toolbar = [
        ['Font', 'FontSize'],
        ['BGColor', 'TextColor' ],
        ['Bold', 'Italic', 'Strike', 'Underline', 'RemoveFormat'],
        ['Image', 'SpecialChar', 'Smiley'],
        ['JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'],
        ['NumberedList', 'BulletedList'],
        ['Link', 'Unlink'],
        ['Source']
    ],
    config.filebrowserUploadMethod = 'form';
};
