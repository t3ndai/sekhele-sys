<template>
    <div>
        <div v-for="job in jobs" class="job-card">
            <div class="value">
                <span class="label">Title:</span> {{ job.title }}
            </div>
            <div class="value">
                <span class="label">Level:</span>{{ job.level }}
            </div>
            <div class="value">
                <span class="label">Started On:</span>{{ job.started_on }}
            </div>
            <div class="value">
                <span class="label">Ended On:</span>{{ job.ended_on }}
            </div>
        </div>
    </div>
</template>

<script setup>
defineProps({
    jobs: Array,
});
</script>

<style scoped>
.job-card {
    border: 1px solid #ccc;
    border-radius: 8px;
    padding: 16px;
    margin-bottom: 16px;
    background-color: #f9f9f9;

    .label {
        color: var(--color-slate-400);
        font-weight: 100;
    }

    .value {
        color: var(--color-slate-800);
        font-weight: 500;
    }
}
</style>
