<template>
    <div>
        <Button
            label="New Talent"
            icon="pi pi-plus"
            @click="visible = true"
            class="new-btn"
        />
    </div>

    <div>
        <Dialog
            v-model="visible"
            :visible="visible"
            header="New Talent"
            @update:visible="visible = $event"
        >
            <form class="space-y-4" @submit.prevent="saveTalent">
                <div class="flex flex-col mb-4 gap-y-0.5">
                    <label for="title">Name</label>
                    <InputText id="title" v-model="form.name" />
                </div>
                <div class="flex flex-col gap-y-0.5">
                    <label for="notes">Description</label>
                    <Textarea
                        id="notes"
                        v-model="form.description"
                        rows="5"
                        cols="30"
                    />
                </div>
                <div>
                    <Button
                        label="Save"
                        icon="pi pi-save"
                        type="submit"
                        class="new-btn"
                        :disabled="form.processing"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import Button from "primevue/button";
import Dialog from "primevue/dialog";
import Textarea from "primevue/textarea";
import InputText from "primevue/inputtext";
import { useForm, usePage } from "@inertiajs/vue3";
import { ref, computed } from "vue";

const page = usePage();
const employee = computed(() => page.props.employee);

const visible = ref(false);

const form = useForm({
    name: "",
    description: "",
});

function saveTalent() {
    //employees/:employee_id/talents
    form.post(`/employees/${employee.value.id}/talents`);
    visible.value = false;
    form.reset();
}
</script>

<style scoped>
.new-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
