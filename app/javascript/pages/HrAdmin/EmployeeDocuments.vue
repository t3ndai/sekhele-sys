<template>
    <div>
        <div v-for="doc in documents" class="document-card">
            <div class="value">
                <span class="label">Name:</span>{{ doc.name }}
            </div>
            <div class="value">
                <span class="label">Type:</span>{{ doc.type }}
            </div>
            <div class="value">
                <span class="label">Link:</span
                ><a :href="doc.url" _target="none">View</a>
            </div>
        </div>
    </div>
</template>

<script setup>
defineProps({
    documents: Array,
});
</script>

<style scoped>
.document-card {
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
