<template>
    <div>
        <div class="font-belgrano text-3xl">{{ report.name }} Career</div>
    </div>
    <div>
        <CareerVision :career_visions />
    </div>
</template>

<script setup>
import CareerVision from "../../components/CareerVision.vue";

defineProps({
    report: Object,
    career_visions: Array,
});
</script>
