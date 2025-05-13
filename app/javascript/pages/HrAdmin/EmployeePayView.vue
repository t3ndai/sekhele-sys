<template>
    <div>
        <NewEmployeePay
            :currency_options
            :pay_type_options
            :frequency_options
        />
    </div>
</template>

<script setup>
import NewEmployeePay from "./NewEmployeePay.vue";

defineProps({
    currency_options: Array,
    pay_type_options: Array,
    frequency_options: Array,
});
</script>

<style scoped></style>
