<template>
    <div>
        <div class="gtco-loader"></div>
        <div id="page">
            <left-bar/>
            <main-content/>
        </div>
        <div class="gototop js-top">
            <a href="#" class="js-gotop"><i class="icon-arrow-up"></i></a>
        </div>
    </div>
</template>
<script>
    import LeftBar from './home/LeftBar'
    import MainContent from './home/MainContent'
    export default {
        name: 'Index',
        components: {
            LeftBar: LeftBar,
            MainContent: MainContent
        }
    }
</script>
