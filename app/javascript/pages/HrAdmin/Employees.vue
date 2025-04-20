<template>
    <h2 class="page-heading">Employees</h2>

    <div>
        <Button asChild v-slot="slotProps">
            <Link
                :href="`/organizations/${org_id}/employees/new`"
                :class="slotProps.class"
                class="action-btn"
            >
                New Employee
            </Link>
        </Button>
    </div>

    <div>
        <DataTable
            :value="employees"
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
                <template #body="{ data }">
                    <Button severity="secondary" asChild v-slot="slotProps">
                        <Link
                            :href="`hr_admin/employees/${data.id}`"
                            :class="slotProps.class"
                            >Detailed View</Link
                        >
                    </Button>
                </template>
            </Column>
        </DataTable>
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
const org_id = computed(() => page.props.org_id)?.value;

defineProps({
    employees: Array,
});
</script>

<style scoped>
.action-btn {
    background-color: orangered;
    border: none;
}
</style>
