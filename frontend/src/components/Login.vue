<template>
    <div>
        {{ messageBody }}
    </div>
</template>

<script>
import vuejsDialogMixin from 'vuejs-dialog/dist/vuejs-dialog-mixin.min.js';

export default {
    name: 'Login',
    mixins: [vuejsDialogMixin],

}
</script>