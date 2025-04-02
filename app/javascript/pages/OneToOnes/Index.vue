<template>
    <div>
        <h2 class="heading belgrano-regular">My Reports 1-1s</h2>

        <DataTable :value="reports" tableStyle="min-width: 50rem">
            <Column field="name" header="Report"></Column>
            <Column>
                <template #body="{ data }">
                    <Link :href="`/employees/${data.employee_id}`">
                    Past 1-1s
                    </Link>
                </template>
            </Column>
            <Column>
                <template #body="{ data }">
                    <Link :href="`/employees/${data.id}/one_to_ones/new`">
                    New 1-1
                    </Link>
                </template>
            </Column>
        </DataTable>

    </div>
</template>

<script setup>

import { Link } from '@inertiajs/vue3'
import { computed } from 'vue'
import { usePage } from '@inertiajs/vue3'
import DataTable from 'primevue/datatable';
import Column from 'primevue/column';

defineProps({
    reports: Array,
})

</script>

<style scoped></style>