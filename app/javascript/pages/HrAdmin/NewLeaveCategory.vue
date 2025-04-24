<template>
    <div>
        <div>
            <Button
                label="New Leave Category"
                icon="pi pi-plus"
                @click="visible = true"
                class="leave-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Leave Category"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveLeaveCategory">
                <div class="flex flex-col mb-2 field">
                    <label for="name">Name</label>
                    <InputText id="name" v-model="form.name" />
                </div>

                <div class="mt-2">
                    <Button
                        class="leave-btn"
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
import { Dialog, Button, InputText } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    name: "",
});

const visible = ref(false);

function saveLeaveCategory() {
    form.post(`/organizations/${org_id}/leave_categories`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.leave-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
