<template>
    <h2 class="heading belgrano-regular">RECRUITMENT</h2>

    <div>
        <DataTable :value="listed_jobs" tableStyle="min-width: 50rem">
            <Column field="title" header="Title" />
            <Column field="num_positions" header="Open Positions" />
            <Column field="date_open" header="Date Open" />
            <Column field="date_close" header="Date Close" />
            <Column field="created" header="Created on" />
        </DataTable>

    </div>

</template>

<script setup>

import { Link } from '@inertiajs/vue3'
import { computed } from 'vue'
import { usePage } from '@inertiajs/vue3'

import DataTable from 'primevue/datatable';
import Column from 'primevue/column';
import ColumnGroup from 'primevue/columngroup';
import Row from 'primevue/row';
import Button from 'primevue/button'

const page = usePage()
const employee = computed(() => page.props.employee)

defineProps({
    listed_jobs: Array,
})


</script>