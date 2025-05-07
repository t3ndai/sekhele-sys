<template>
    <div class="flex flex-col gap-y-8">
        <div>
            <h2 class="heading belgrano-regular">New 1-1 as of {{ date }}</h2>
        </div>

        <div>
            <form @submit.prevent="save" class="flex flex-col gap-y-4">
                <Editor
                    v-model="form.one_to_one.note"
                    placeholder="write your 1-1 notes here"
                    editorStyle="height: 320px"
                />
                <div>
                    <Button
                        label="Save"
                        icon="pi pi-save"
                        type="submit"
                        class="btn"
                        :disabled="form.processing"
                    />
                </div>
            </form>
        </div>

        <!--
        <div>
            <div v-for="item in agenda_items" :key="item.id">
                <Checkbox v-model="item.completed" />
                <p>{{ item.name }}</p>
            </div>
        </div>

        <div>
            <form v-if="showAgendaForm" @submit.prevent="agendaForm.post('/employees/${employee.id}/one_to_ones/')">
                <Checkbox v-model="agendaForm.completed" />
                <InputText v-model="agendaForm.name" placeholder="Agenda Item" @keyup.enter="saveAgendaItem" />
            </form>
            <Button label="Add Agenda Item" icon="pi pi-plus" @click="toggleAgendaForm" />
        </div>
    --></div>
</template>

<script setup>
import { Link } from "@inertiajs/vue3";
import { computed } from "vue";
import { usePage, useForm } from "@inertiajs/vue3";
import Editor from "primevue/editor";
import Button from "primevue/button";
import InputText from "primevue/inputtext";
import Checkbox from "primevue/checkbox";

const page = usePage();
const employee = computed(() => page.props.employee);

const props = defineProps({
    date: String,
    report_id: Number,
    agenda_items: Array,
});

const form = useForm({
    one_to_one: {
        note: "",
    },
});

const agendaForm = useForm({
    name: "",
    completed: false,
});

const showAgendaForm = defineModel({ default: false });

function save() {
    const { report_id } = props;
    form.post(`/employees/${report_id}/one_to_ones/`);
}

function saveAgendaItem() {
    const { report_id } = props;
    agendaForm.post(`/employees/${report_id}/agenda_items/`);
    agendaForm.reset();
}

function toggleAgendaForm() {
    console.log("clicked");
    showAgendaForm.value = !showAgendaForm.value;
}
</script>

<style scoped>
.btn {
    background-color: orangered;
    border: none;
}

.cancel-btn {
    background-color: lightgray;
    padding: 12px;
    border: none;
    border-radius: 6px;
}
</style>
