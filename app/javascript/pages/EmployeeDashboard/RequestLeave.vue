<template>
    <Button class="book-btn" @click="toggleDialog">Book Leave</Button>

    <Dialog
        v-model:visible="visible"
        :modal="true"
        :header="'Request Leave'"
        :style="{ width: '25vw' }"
    >
        <template #header>
            <h2>Request Leave</h2>
        </template>

        <form @submit.prevent="submitLeave" class="flex flex-col space-y-4">
            <div class="flex flex-col gap-y-2 mb-4">
                <label for="leave_type">Leave Type</label>
                <Select
                    id="leave_type"
                    v-model="form.leave_policy"
                    :options="leave_policies"
                    optionLabel="name"
                    filter
                    placeholder="Select Leave Type"
                    class="w-full md:w-56"
                />
            </div>

            <div class="flex flex-col gap-y-0.5 mb-4">
                <label for="date_from">Start Date</label>
                <input
                    type="date"
                    class="form-control"
                    id="date_from"
                    v-model="form.date_from"
                />
            </div>

            <div class="flex flex-col gap-y-0.5 mb-4">
                <label for="date_to">End Date</label>
                <input
                    type="date"
                    class="form-control"
                    id="date_to"
                    v-model="form.date_to"
                />
            </div>

            <div class="flex flex-col gap-y-0.5">
                <label for="reason">Reason</label>
                <TextArea id="reason" v-model="form.reason" />
            </div>

            <Button
                label="Submit"
                icon="pi pi-check"
                type="submit"
                class="book-btn"
                :disabled="form.processing"
            />
        </form>
    </Dialog>
</template>

<script setup>
import Button from "primevue/button";
import Dialog from "primevue/dialog";
import DatePicker from "primevue/datepicker";
import Select from "primevue/select";
import TextArea from "primevue/textarea";

import { computed } from "vue";
import { usePage } from "@inertiajs/vue3";
import { useForm } from "@inertiajs/vue3";

const page = usePage();
const employee = computed(() => page.props.employee);
const employee_id = employee.value.id;

const form = useForm({
    date_from: "",
    date_to: "",
    end_date: "",
    leave_policy: "",
    reason: "",
});

const visible = defineModel({
    type: Boolean,
    default: false,
});

defineProps({
    leave_policies: Array,
});

function toggleDialog() {
    visible.value = !visible.value;
}

function submitLeave() {
    form.post(`/employees/${employee_id}/leave_requests`, {
        onSuccess: () => {
            visible.value = false;
            form.reset();
        },
        onError: () => {
            console.error("Error submitting leave request");
        },
    });
}
</script>

<style lang="css" scoped>
.book-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
