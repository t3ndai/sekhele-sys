<template>
    <div>
        <div>
            <Button
                label="New Pulse Survey"
                icon="pi pi-plus"
                @click="visible = true"
                class="btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Pulse Survey"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="savePulseSurvey">
                <div class="flex flex-col mb-2 field">
                    <label for="name">Name</label>
                    <InputText id="name" v-model="form.name" />
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="opens_on">Opens On</label>
                    <input
                        type="date"
                        name="opens_on"
                        id="opens_on"
                        v-model="form.date_open"
                    />
                    <div v-if="form.errors.date_open" class="error">
                        {{ form.errors.date_open.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <label class="label" for="date_close">Closes On</label>
                    <input
                        type="date"
                        name="date_close"
                        id="date_close"
                        v-model="form.date_close"
                    />
                    <div v-if="form.errors.date_close" class="error">
                        {{ form.errors.date_close.join(", ") }}
                    </div>
                </div>

                <div class="mt-2">
                    <Button
                        class="btn"
                        label="Save"
                        icon="pi pi-save"
                        type="submit"
                        :disabled="form.processing"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, Button, InputText, DatePicker } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    name: "",
    date_open: "",
    date_close: "",
});

const visible = ref(false);

function savePulseSurvey() {
    form.post(`/organizations/${org_id}/pulse_surveys`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
