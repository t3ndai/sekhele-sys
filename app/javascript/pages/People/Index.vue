<template>
    <div>
        <h2 class="page-heading">Directory</h2>

        <div>
            <DataTable
                :value="people"
                paginator
                :rows="10"
                tableStyle="min-width: 50rem"
            >
                <Column field="full_name" header="Full Name" />
                <Column field="tenure" header="Tenure" />
                <Column field="job_title" header="Job Title" />
                <Column field="job_level" header="Job Level" />
                <Column field="department" header="Department" />
                <Column field="location" header="Location" />
                <Column field="manager" header="Manager" />
                <Column>
                    <template #body=""> </template>
                </Column>
            </DataTable>
        </div>
    </div>
</template>

<script setup>
import { Link, usePage } from "@inertiajs/vue3";
import { computed } from "vue";

import DataTable from "primevue/datatable";
import Column from "primevue/column";
import Button from "primevue/button";

const page = usePage();
const employee = computed(() => page.props.employee);

defineProps({
    people: Array,
});
</script>
