<template>
    <form @submit.prevent="$emit('onSubmit', form)">
        <div class="form-field">
            <label for="title">Title</label>
            <InputText id="title" v-model="form.title" />
        </div>
        <div class="form-field">
            <label for="num_positions">Number of Positions</label>
            <InputNumber id="num_positions" v-model="form.num_positions" />
        </div>
        <div class="form-field">
            <label for="date_open">Date Open</label>
            <DatePicker id="date_open" v-model="form.date_open" />
        </div>
        <div class="form-field">
            <label for="date_close">Date Close</label>
            <DatePicker id="date_close" v-model="form.date_close" />
        </div>
        <div>
            <label for="description">Description</label>
            <Editor
                id="description"
                v-model="form.description"
                editorStyle="height: 320px"
            ></Editor>
        </div>
        <div class="mt-4">
            <Button type="submit" class="btn" :disabled="form.processing">{{
                submitText
            }}</Button>
        </div>
    </form>
</template>

<script setup>
import { useForm } from "@inertiajs/vue3";

import Editor from "primevue/editor";
import DatePicker from "primevue/datepicker";
import InputNumber from "primevue/inputnumber";
import InputText from "primevue/inputtext";
import Button from "primevue/button";

const { job_posting, submitText } = defineProps(["job_posting", "submitText"]);

const form = useForm({
    title: job_posting.title || "",
    num_positions: job_posting.num_positions || "",
    date_open: job_posting.date_open || "",
    date_close: job_posting.date_close || "",
    description: job_posting.description || "",
});
</script>

<style scoped>
.form-field {
    display: flex;
    flex-direction: column;
    margin-bottom: 1.2rem;
}

.btn {
    background-color: orangered;
    border: none;
}
</style>
