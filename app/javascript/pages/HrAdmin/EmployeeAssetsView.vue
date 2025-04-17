<template>
    <div>
        <div v-for="asset in assets" class="asset-card">
            <div class="value">
                <span class="label">Name:</span> {{ asset.name }}
            </div>
            <div class="value">
                <span class="label">Category:</span>{{ asset.category }}
            </div>
            <div class="value">
                <span class="label">Serial #:</span>{{ asset.serial_number }}
            </div>
            <div class="value">
                <span class="label">Date Given:</span>{{ asset.date_given }}
            </div>
            <div class="value">
                <span class="label">Date Returned:</span
                >{{ asset.date_returned }}
            </div>
        </div>
    </div>
</template>

<script setup>
defineProps({
    assets: Array,
});
</script>

<style scoped>
.asset-card {
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
