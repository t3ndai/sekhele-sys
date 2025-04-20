<template>
    <Head title="New Employee" />

    <h2 class="page-heading">New Employee</h2>

    <div>
        <EmployeeForm
            :employee
            submitText="Create Employee"
            @onSubmit="handleSubmit"
        />
    </div>
</template>

<script setup>
import { Head, Link, usePage } from "@inertiajs/vue3";
import { computed } from "vue";
import EmployeeForm from "./EmployeeForm.vue";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

function handleSubmit(form) {
    form.transform((data) => ({
        employee: { ...data, gender: data.gender.toLowerCase() },
    }));
    form.post(`/organizations/${org_id}/employees`);
}

defineProps({
    employee: Object,
});
</script>
