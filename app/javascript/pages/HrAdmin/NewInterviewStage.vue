<template>
    <div>
        <div>
            <Button
                label="New Interview Stage"
                icon="pi pi-plus"
                @click="visible = true"
                class="btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Interview Stage"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveInterviewStage">
                <div class="flex flex-col mb-2">
                    <label class="label" for="name">Name</label>
                    <InputText name="name" id="name" v-model="form.name" />
                    <div v-if="form.errors.name" class="error">
                        {{ form.errors.name.join(", ") }}
                    </div>
                </div>
                <div class="flex flex-col mb-2">
                    <Select
                        placeholder="Stage Type"
                        :options="stage_types"
                        optionLabel="name"
                        optionValue="value"
                        v-model="form.stage_type"
                        @change="stage_type = $event.value"
                    />
                    <div v-if="form.errors.stage_type" class="error">
                        {{ form.errors.stage_type.join(", ") }}
                    </div>
                </div>
                <div class="field mb-2">
                    <fieldset class="radios">
                        <legend>Mandatory</legend>
                        <div class="flex gap-x-2">
                            <div class="flex">
                                <RadioButton
                                    v-model="form.mandatory"
                                    inputId="mandatory"
                                    name="mandatory"
                                    value="required"
                                />
                                <label for="status">Required </label>
                            </div>
                            <div class="flex">
                                <RadioButton
                                    v-model="form.mandatory"
                                    inputId="mandatory"
                                    name="mandatory"
                                    value="optional"
                                />
                                <label for="mandatory">Optional </label>
                            </div>
                        </div>
                    </fieldset>
                </div>

                <div>
                    <Button
                        class="btn"
                        type="submit"
                        :disabled="form.processing"
                        label="Save Interview Stage"
                        icon="pi pi-save"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, Select, InputText, Button, RadioButton } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    name: "",
    stage_type: "",
    mandatory: "",
});

const visible = ref(false);

defineProps({
    stage_types: Array,
});

function saveInterviewStage() {
    form.transform((data) => ({ interview_stage: data }));
    form.post(`/organizations/${org_id}/interview_stages`, {
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
