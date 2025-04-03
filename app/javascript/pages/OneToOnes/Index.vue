<template>
    <div>
        <h2 class="heading belgrano-regular">My Reports 1-1s</h2>


        <DataTable :value="reports" tableStyle="min-width: 50rem">
            <Column field="name" header="Report"></Column>
            <Column>
                <template #body="{ data }">
                    <Link :href="`/employees/${data.id}/one_to_ones`">
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

        <div>
            <h2 class="heading belgrano-regular">My 1-1s</h2>
            <div v-for="one_to_one in one_to_ones">
                <div>{{ one_to_one.meeting_on }}</div>
                <div>View Notes</div>
                <div v-html="one_to_one.note"></div>
            </div>
        </div>

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
    one_to_ones: Array,
})

</script>

<style scoped></style>